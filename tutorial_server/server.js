const CLIENT_ID = '0c5be0c916f1499e8bab86b32acfc7b6';
const CLIENT_SECRET = 'f296d449b9034a6998106924a82dee55';
const REDIRECT_URI = 'edm-app://callback';
const GRANT_TYPE = 'authorization_code';

var express = require('express');
var expressGraphQL = require('express-graphql').graphqlHTTP;
const fetch = require("node-fetch");
const { graphqlHTTP, buildSchema} = require('graphql');

const schema = buildSchema(`
    type Artist {
        images: [Image!]!
        name: String
        popularity: Int
        type: String
        uri: String
    }

    type Image {
        height: Int
        url: String
        width: Int
    }

    type Query {
        getAlbum(token: String!, id: String!): Album
        getResponse(code: String!): Response
        getNewReleases(token: String!): Album
        getRelatedArtists(token: String!): [Artist!]!
    }

    type Mutation {
        postCode(code: String!): [Artist!]!
    }

    type Album {
        album_type: String
        
        available_markets: [String]
        # genres are always empty from spotify
        genres: [String]
        href: String
        id: String
        
        label: String
        name: String
        popularity: Int
        release_date: String
        release_date_precision: String

        total_tracks: Int
        type: String
        uri: String
    }

    type Response {
        access_token: String
        token_type: String
        scope: String
        expires_in: Int
        refresh_token: String 
    }
`);
var accessToken;

function makeHeaders(token) {
    return {
        'Authorization': 'Bearer ' + token,
        'Content-Type': 'application/json',
        'Accept': "application/json"
    }
}

async function getRefresh(token) {
    const response = await fetch('https://accounts.spotify.com/api/token', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: new URLSearchParams(
            `client_id=${CLIENT_ID}&client_secret=${CLIENT_SECRET}&grant_type=${GRANT_TYPE}&refresh_token=${token}`
        )
    })
} 

async function getResponse ({code}) {
    const response = await fetch('https://accounts.spotify.com/api/token', {
        method: 'POST',
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
        },
        body: new URLSearchParams(
            `client_id=${CLIENT_ID}&client_secret=${CLIENT_SECRET}&redirect_uri=${REDIRECT_URI}&grant_type=${GRANT_TYPE}&code=${code}`
            ),    
    });
    const responseJSON = await response.json();
    console.log(responseJSON)
    accessToken = responseJSON['access_token'];
    console.log(accessToken)
}

async function getNewReleases(token, limit=3) {
    console.log(token)
    const response = await fetch(`https://api.spotify.com/v1/browse/new-releases?limit=${limit}`, {
        method: 'GET',
        headers: makeHeaders(token),
    });
    const responseJSON = await response.json();
    console.log(responseJSON['albums']['items']);
    return responseJSON; 
}

async function getRelatedArtists(token, alanWalkerID='7vk5e3vY1uw9plTHJAMwjN') {
    const response = await fetch(`https://api.spotify.com/v1/artists/${alanWalkerID}/related-artists`, {
        method: 'GET',
        headers: makeHeaders(token),
    });
    const responseJSON = await response.json();
    console.log(responseJSON['artists'][0]['images'][0]['url']);
    console.log(responseJSON);
    return responseJSON['artists'];
    //return responseJSON;
}

//?limit=${limit}

const root = { 
    getAlbum : async ({ token, id }) => {
        const response = await fetch(`https://api.spotify.com/v1/albums/${id}`, {
            method: 'GET',
            headers: makeHeaders(token)
        });
        return response.json(); 
    },

    postCode: async (code) => {
        await getResponse(code);
        //await getNewReleases(accessToken);
        await getRelatedArtists(accessToken);
    },

   
}

const app = express()

app.use('/', expressGraphQL({
    schema: schema,
    rootValue: root,
    graphiql: true,
}))
app.listen(5000, () => console.log('Server Running On localhost:5000/'))

var stateKey = 'spotify_auth_state';