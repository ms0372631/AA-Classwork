import React from "react";
import Widgets from "./widgets";

// const Clock =(props)=>{
//     return (
//         <div>
//             <h1>React works</h1>
//         </div>
//     )
// }
class Clock extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            newDate: new Date()
        };
        
        this.tick = this.tick.bind(this);

    }
    componentDidMount(){
        this.intervalid = setInterval(this.tick, 1000);
    }

    componentWillUnmount() {
        clearInterval(this.intervalid);
    }

    tick(){
        this.setState({newDate: new Date()});
    }

    render() {
       
        return (
            <div>
                <h1>{this.state.newDate.toString()}</h1>
            </div>
        )
    }
}
export default Clock