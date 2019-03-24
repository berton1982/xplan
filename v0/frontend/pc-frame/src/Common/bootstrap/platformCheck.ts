import {OS, AGENT, ARCH, IPlatformInfo} from '../../Interfaces/IPlatformInfo';

export function checkPlatform():IPlatformInfo {
    let platformInfo:IPlatformInfo = {
        agentInfo:{
            agent : AGENT.CHROME,
            engine: 'Blink',
            engine_version_major: 71,
            engine_version_minor: 0,
            engine_version_patch: 3578
        }
    };

    return platformInfo;
}