import React from 'react';
import {BaseLayout} from '../BaseLayout';

export class PcLayout extends BaseLayout{
    constructor(props:any){
        super(props)
    }
    render(){
        return (
            <div>
                <p>this is Pc Layout</p>
            </div>
        )
    }
}