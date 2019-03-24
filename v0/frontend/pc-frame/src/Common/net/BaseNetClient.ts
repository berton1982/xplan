// 參考https://github.com/elbywan/wretch
// https://github.com/aurelia/fetch-client, 封裝fetch,和websocket
class BaseNetClient{
    constructor(){}

    post(url:string,params:any,options:any):Promise<any> {
        return new Promise((resolve, reject) => {
            fetch(url);
        })
    }
    get(url:string,options:any) {
        return fetch(url)
    }
    html(){}
    json(){}
    uploadFile(){}
    delete() {}
    websocket() {}
    jsonp() {}
}

export { BaseNetClient }