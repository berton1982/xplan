// 參考https://github.com/elbywan/wretch
// https://github.com/aurelia/fetch-client, 封裝fetch,和websocket
class BaseNetClient{
    constructor(){}

    post() {}
    get() {}
    html(){}
    json(){}
    uploadFile(){}
    delete() {}
    websocket() {}
    jsonp() {}
}

export { BaseNetClient }