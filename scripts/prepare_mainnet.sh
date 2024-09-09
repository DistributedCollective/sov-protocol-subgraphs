export VERSION=v3;
export BLOCKCHAIN=v3;
export NETWORK=bob; 
export SLUG=protocol-v3-bob;

red=`tput setaf 1`
yellow=`tput setaf 3`
green=`tput setaf 2`
reset=`tput sgr0`

echo "Preparing subgraph for ${yellow}$NETWORK${reset} network" && echo;
npx mustache ./config/${NETWORK}.${VERSION}.json ./templates/${BLOCKCHAIN}.subgraph.template.yaml > subgraph.yaml && rm -rf generated;
echo "File: ${green}subgraph.yaml${reset} has been mustached";
echo "copying schema... ${VERSION}";
cp ./schemas/${VERSION}.schema.graphql schema.graphql;
echo "Build starting...";
npm run codegen && npm run build;
echo "File: ${green}subgraph.yaml${reset} has been mustached";
npx npm run deploy;
echo "File: ${green}src/config/contracts.ts${reset} has been mustached";