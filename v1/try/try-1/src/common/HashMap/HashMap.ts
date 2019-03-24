/**
 * 实现类似java的HashMap
 */

 /**
  * 待实现iterator接口
  */

export interface IHashCode {
    (): string
}
export interface IEquals {
    (): boolean
}
export interface T {
    hashCode: IHashCode
}

export interface IReadOnlyHashMap<K extends T, U>{
    containsKey:(key:K)=>boolean,
    size: ()=>number,
    get: (key:K)=>U|undefined
};

export class HashMap<K extends T, U> implements IReadOnlyHashMap<K, U>{
    // 存储值
    private map_value: Map<string, U>;
    // 存储键
    private map_key: Map<string, K>;
    constructor() {
        this.map_key = new Map();
        this.map_value = new Map();
    }

    containsKey = (key: K): boolean => {
        let _key = key.hashCode();
        return this.map_key.has(_key);
    }

    removeKey = (key: K): U | undefined => {
        let result:U | undefined  = undefined;
        let _key = key.hashCode();
        if(this.map_key.has(_key)){
            result = this.map_value.get(_key);
            this.map_key.delete(_key);
            this.map_value.delete(_key);
        }

        return result;
    }

    put = (key:K, value:U) :boolean => {        
        let _key: string = key.hashCode();
        if(this.map_value.has(_key)){
            this.map_value.set(_key, value);
        }else{
            this.map_key.set(_key, key);
            this.map_value.set(_key, value);
        }

        if(this.map_key.has(_key) && this.map_value.has(_key)){
            return true;
        }else{
            this.map_key.delete(_key);
            this.map_value.delete(_key);
            return false;
        }
    }

    size = (): number => {
        return this.map_key.size;
    }

    get = (key:K): U | undefined => {
        let result: U | undefined = undefined;
        let _key:string = key.hashCode();
        if(this.map_key.has(_key) && this.map_value.has(_key)){
            result = this.map_value.get(_key);
        }

        return result;
    }

    // 待实现foreach(value,key,map) ,map为IReadOnlyHashMap，不可以对map进行修改， value和key都是clone对象

    // 待实现，返回迭代器
    keys = ()=>{};
    values = () => {};
    entries = () => {};    
    [Symbol.iterator] = () => {}
};