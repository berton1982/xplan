import {checkPlatform} from '../bootstrap/platformCheck'
import { IPlatformInfo, AGENT } from '../../Interfaces/IPlatformInfo';
import { ICacheService } from '../../Interfaces/ICache';
import { BrowserCacheService } from './browserCacheService';
import { BaseCacheService } from './baseCacheService';
import { pivotService } from '../pivotService';
import {SYMBOL_FRAME_CACHE_SERVICE} from '../symbols'

function registerService(){
    let cacheService:ICacheService = pivotService.getService(SYMBOL_FRAME_CACHE_SERVICE);
    if(cacheService == null){
        let platform:IPlatformInfo = checkPlatform();
        if(platform.agentInfo.agent == AGENT.CHROME){
            cacheService = new BrowserCacheService();
        }else{
            cacheService = new BaseCacheService();
        }

        pivotService.registerService(SYMBOL_FRAME_CACHE_SERVICE, cacheService);
    }
    
    return cacheService;
}

export default {registerService}