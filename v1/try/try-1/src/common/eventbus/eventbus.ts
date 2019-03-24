/**
 * EventBus
 */
// 返回EventBus的代理，杜绝客户端操作EventBus，防止串改数据，同时可对调用接口增加切面操作

import {Event, IEventData, IEventType} from './event';
import {Observable} from 'rxjs';

export interface IEventBus{
    emitEvent : (event:Event)=>void
}
// 用于传输给子组件用于注册抛出事件和可接受处理事件类型
export interface IEventRegister {
    registerEventType : (eventType:IEventType) => void;
    addEventTypeListener: (eventType:IEventType) => Observable<IEventData>;
    unregisterEventType: (eventType:IEventType) => void;
}

export class EventBus {
    // 用于初始化子组件时传递给子组件使用的事件类型注册器，其子组件抛出的事件可以在该组件或者模块内部消费使用
    public getEventTypeRegister = ():IEventRegister => {
        return {
            registerEventType : this.registerEventType,
            addEventTypeListener : this.addEventTypeListener,
            unregisterEventType : this.unRegisterEventType
        }
    }

    // 传递给子组件用于发出向子组件外部发出事件的接口
    public getEventBusProxy = ():IEventBus=>{
        return {
            emitEvent : this.emitEvent
        }
    }
    private emitEvent = (event:Event):void => {}
    // 用于注册某种事件类型
    private registerEventType = (eventType:IEventType):void => {}
    // 用于取消注册某种事件类型
    private unRegisterEventType = (eventType:IEventType):void => {}
    private addEventTypeListener = (eventType: IEventType):Observable<IEventData> => {
        return new Observable();
    }
}