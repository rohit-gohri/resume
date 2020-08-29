#! /usr/bin/env node
const {Connect} = require('sm-utils');

const target = process.env.DEPLOY_TARGET || process.env.DEPLOY_ENV || 'production';
const branch = process.env.DEPLOY_BRANCH || 'master';
let build = process.env.DEPLOY_BUILD;

const githubRepo = process.env.GITHUB_REPOSITORY// Full repo name: owner/repo
const githubUser = process.env.GITHUB_ACTOR;

const apiHost = process.env.DRONE_SERVER || 'https://cloud.drone.io';
const apiToken = process.env.DRONE_TOKEN;
const apiBase = `${apiHost}/api`;

async function getBuild() {
    if (build) {
        return Number(build);
    }
    const response = await Connect.url(
        `${apiBase}/repos/${githubRepo}/builds`
    );
    const builds = JSON.parse(response.body);

    for (let i = 0; i < builds.length; i++ ) {
        const buildItem = builds[i];
        if (buildItem.source === branch &&
            buildItem.event === 'push' &&
            buildItem.author_login === githubUser
            ) return buildItem.number;
    }
    throw new Error(`No build matching branch, ${branch}, found.`);
}

async function promoteBuild(buildNumber) {
    console.log(`Promoting build ${buildNumber} to ${target}`);
    const response = await Connect.post(
        `${apiBase}/repos/${githubRepo}/builds/${buildNumber}/promote?target=${target}`
    ).bearerToken(apiToken);
    const deploy = JSON.parse(response.body);
    return deploy.number;
}

async function main() {
    const bldNum = await getBuild();
    return promoteBuild(bldNum);
}

main().then((newBld) => {
    console.log(`Deploy triggered succesfully: ${apiHost}/${githubRepo}/${newBld}`);
}).catch((err) => {
    console.error(`There was an error:\n`, err);
});
