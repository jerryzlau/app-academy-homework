import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    //your code here
    this.state = {num1: "", num2: "", result: 0};

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);

    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  //your code here
  setNum1(e) {
    // your code here
    const num1 = e.target.value;
    if(num1){
      this.setState({num1: parseInt(num1)});
    }else{
      this.setState({num1: ""});
    }
  }

  setNum2(e) {
    // your code here
    const num2 = e.target.value;
    if(num2){
      this.setState({num2: parseInt(num2)});
    }else{
      this.setState({num2: ""});
    }
  }

  add(e){
    e.preventDefault();
    const result = this.state.num1 + this.state.num2;
    this.setState({result});
  }

  subtract(e){
    e.preventDefault();
    const result = this.state.num1 - this.state.num2;
    this.setState({result});
  }

  multiply(e){
    e.preventDefault();
    const result = this.state.num1 * this.state.num2;
    this.setState({result});
  }

  divide(e){
    e.preventDefault();
    const result = this.state.num1 / this.state.num2;
    this.setState({result});
  }

  clear(e){
    e.preventDefault();
    const num1 = "";
    const num2 = "";
    const result = 0;
    this.setState({num1, num2, result});
  }

  render(){
    const {num1, num2, result} = this.state;
    return (
      <div>
        <h1>Jerry's Calculator App</h1>
        <h1>Result: {result}</h1>

        <label>Num1
        <input onChange={this.setNum1} value={num1}/>
        </label>

        <label>Num2
        <input onChange={this.setNum2} value={num2}/>
        </label>

        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>

        <button onClick={this.clear}>Clear</button>


      </div>
    );
  }
}

export default Calculator;
