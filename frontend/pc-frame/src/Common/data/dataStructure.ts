// 定义type.d.ts

// 两者可以选择一个或者组合生效
class BaseDataHeader{
    module = "moduleName";
    applicationId = "applicationId";
}

class BzDataHeader {

}

// 模仿XSD
class Attribute {
    name = "";
    valueType = "Attribute|String|Number|NULL|undefined|boolean"

}

class bodyData{

}

class BaseDataStructure{
    header = {}
    body = {}
}