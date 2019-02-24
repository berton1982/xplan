import React from 'react';
import {BaseModule} from '../BaseModule'

export class BaseLayout extends BaseModule{
    constructor(props: any){
        super(props)
    }

    render(){
        return (
            <div>
                <p> this is base layout.</p>
                <p> please use the inherited layout.</p>
            </div>
        )
    }
}