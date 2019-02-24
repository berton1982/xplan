import React, {Component} from 'react';

interface IModuelInfo{
    moduleName:string,
    moduleId:string,
    moduleVersion:string,
    moduleDate?:Date,
    author:string,
    token?:string
}

export abstract class BaseModule extends Component{
    private moduleInfo:IModuelInfo;    

    constructor(props:any){
        super(props);
        this.moduleInfo = {
            moduleName : "Base Module",
            moduleId : "123",
            moduleVersion : "0.0.1 alpha",
            moduleDate : new Date(),
            author : "Berton J."     
        }
    }

    loadConfig(config:IModuelInfo){
        this.moduleInfo.moduleName = config.moduleName || this.moduleInfo.moduleName;
        this.moduleInfo.moduleId = config.moduleId || this.moduleInfo.moduleId;
        this.moduleInfo.moduleVersion = config.moduleVersion || this.moduleInfo.moduleVersion;
        this.moduleInfo.moduleDate = config.moduleDate || this.moduleInfo.moduleDate;
        this.moduleInfo.author = config.author || this.moduleInfo.author;
        this.moduleInfo.token = config.token || this.moduleInfo.token
    }
}