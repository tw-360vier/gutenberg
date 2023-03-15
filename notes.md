to run tests:


    git checkout v15.3.1
    npm install -g npm@6
    npm i
    npm run prebuild:packages
    npm run build
    wp-env start
    npm run test:e2e:playwright
    wp-env stop


