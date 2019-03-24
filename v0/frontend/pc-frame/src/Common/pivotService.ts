/**
 * 该服务主要用于注册服务，提供单例服务， 后期改造成inject注解模式
 */
 
export interface IRegisterResult{
    result:boolean,
    description?: string
}
class Pivot{
    private static instance:Pivot;
    private serviceMap:Map<Symbol, any> = new Map();
    private Pivot(){}
    public static getInstance():Pivot {
        if(Pivot.instance == null){
            Pivot.instance = new Pivot();
        }
        return Pivot.instance;
    }

    public registerService = (symbolServiceName:Symbol, service:any):IRegisterResult => {
        if(service == null){
            return {
                result: false,
                description: "待注册的服务为空"
            }
        }else if(this.serviceMap.get(symbolServiceName) != null){
            return {
                result: false,
                description: "服务"+symbolServiceName.description+"已经存在"
            }
        }else{
            this.serviceMap.set(symbolServiceName, service);

            return {
                result: true
            }
        }
    }

    public getService = (symbol:Symbol): any =>{
        return this.serviceMap.get(symbol);
    }
}

const instance = Pivot.getInstance();

export {instance as pivotService};