/**
 * 组件配置文件示范，参考借鉴 ant-design
 */
config = {
    belongId: "belongToSomeModuleId", // 属于某个模块下的组件， 默认为global， 即不属于某一个具体模块，所有模块都可以引入
    componentId: "componentId", // 组件的Id，应该由某个id生成器产生，比如uuid,以避免冲突
    componentName: "componentName", // 组件的名称
    componentDescription: "description", // 组件的描述
    componentType: "basic", // 基础组件
    events: [{
        eventCategory: "inputEvent", // "inputEvent|outputEvent", 该组件接受的业务输入事件，业务事件都在事件总线或者context上进行传播。 采用rxjs
        eventHeader?:{},  // 业务事件头,接口待定义
        eventData?:{}, // 业务事件具体负载
        eventExtraInfo?:{}, //业务事件的其他信息，如
        eventHandler?:[], // 业务事件的响应处理器
        aopMiddleWare:[], //支持事件处理前后的aop配置
    },{
        eventCategory: "UIEvent", //页面元素，键盘鼠标等原生事件
    }]
}