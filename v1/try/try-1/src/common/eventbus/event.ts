/**
 * 
 */

 /**
  * 事件类型： 
  *     application: 整个应用范围内的事件，主要用于在模块中通信，但是每个模块甚至其组件都可以监听
  *     module: 模块内部使用的事件类型，主要用于模块内部的组件使用
  *     component: 组件内部使用的事件类型，不会传播到模块内部
  */
 export enum EVENT_TYPE{ "APPLICATION"="APPLICATION", "MODULE"="MODULE", "COMPONENT"="COMPONENT"};

 export interface IEventType{
     type:EVENT_TYPE,
     // 应用名称：版本号：应用Id。  -》 applicationName:v1.0.3:applicationInstanceId
     application:string,
     // 应用之中的命名空间，该事件只有在该命名空间中有效
     namespace:string,
     // 组织名称，应该是全球唯一。 同一组织内部可能会有多个应用
     orgnization:string,
     // 事件名称
     name:string
 }

 export interface IEventData{

 }

 export class Event{
     private eventType:IEventType;
     private eventData:IEventData;

     constructor(eventType:IEventType, eventData:IEventData){
         this.eventType = eventType;
         this.eventData = eventData;
     }

     public getEventType = ():IEventType => {
         return this.eventType;
     }

     public getEventData = ():IEventData => {
         return this.getEventData;
     }
 }