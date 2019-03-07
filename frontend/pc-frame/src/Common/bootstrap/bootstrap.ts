import {PcLayout} from '../../BaseModules/layout/pcLayout';
import {checkPlatform} from './platformCheck';
import { IPlatformInfo } from '../../Interfaces/IPlatformInfo';
import {pivotService} from '../pivotService';
import {} from '../cache'

/**
 * 0. 初始化基础服务： 网络，注入，aop
 * 1. 初始化数据模块
 * 2. 初始化插件系统
 * 3. 加载基础插件：       
 * 4. 登录
 * 5. 获取用户插件信息
 * 6. 加载用户插件信息
 */
/**
 * 检测平台信息，以用来加载不同BaseFrame
 */


let platformInfo: IPlatformInfo = checkPlatform();

function getLastLoginUserInfo(){};
function initBaseFrame(){};
function Login() {};
function initModuleLoader(){};
function loadUserModules() {};

export {PcLayout as Layout}