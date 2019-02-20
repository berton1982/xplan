import React from 'react';
import { BaseLayout } from '../../../Interfaces';

export class PcLayout extends BaseLayout {
    constructor(props: any){
        super(props)
    }

    render(){
        return (
            <div>
                <p>this pc layout</p>
            </div>
        )
    }
}