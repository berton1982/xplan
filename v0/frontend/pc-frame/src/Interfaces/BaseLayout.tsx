import React, { Component } from 'react';

export class BaseLayout extends Component{
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