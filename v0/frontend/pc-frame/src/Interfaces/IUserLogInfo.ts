export enum LANGUAGE{CHINESE='CHINESE', ENGLISH='ENGLISH'}

export interface IUserLoginTheme{

}

export interface IUserLogInfo{
    accout: string,
    lastLogin: Date,
    lastLoginTheme: IUserLoginTheme,
    locale: LANGUAGE
}