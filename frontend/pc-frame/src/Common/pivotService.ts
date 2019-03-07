/**
 * 该服务主要用于注册服务，提供单例服务， 后期改造成inject注解模式
 */
 
export interface IRegisterResult{
    result:boolean,
    description?: string
}
class Pivot{
    private static instance:Pivot;
    private serviceMap:Map<string, any> = new Map();
    private Pivot(){}
    public static getInstance():Pivot {
        if(Pivot.instance == null){
            Pivot.instance = new Pivot();
        }
        return Pivot.instance;
    }

    public registerService = (serviceName:string, service:any):IRegisterResult => {
        if(service == null){
            return {
                result: false,
                description: "待注册的服务为空"
            }
        }else if(this.serviceMap.get(serviceName) != null){
            return {
                result: false,
                description: "服务"+serviceName+"已经存在"
            }
        }else{
            this.serviceMap.set(serviceName, service);

            return {
                result: true
            }
        }
    }

    public getService = (serviceName: string): any =>{
        return this.serviceMap.get(serviceName);
    }
}

const instance = Pivot.getInstance();

export {instance as pivotService};