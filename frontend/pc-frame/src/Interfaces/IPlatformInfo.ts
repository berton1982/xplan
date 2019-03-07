import { IGetCacheService } from "./ICache";

export enum OS{ WIN='WIN', LINUX='LINUX', UNIX='UNIX', ANDROID='ANDROID', MAC='MAC OS'};
export enum ARCH{ X64='X64_32', X32='X32', ARM='ARM'};
export enum AGENT{CHROME='CHROME', MOZILLA='MOZILLA', IE='IE'};

export interface IPlatformInfo{
    systemInfo? : {
        os: OS,
        arch: ARCH,
        kernel: string,
        kernel_version_major: number,
        kernel_version_minor: number,
        kernel_version_patch?: number
    },
    agentInfo : {
        agent: AGENT,
        engine: string,
        engine_version_major: number,
        engine_version_minor: number,
        engine_version_patch?: number
    },
    getCacheService: IGetCacheService
}