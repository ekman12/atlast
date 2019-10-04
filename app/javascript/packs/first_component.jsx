class FirstComponent extends React.Component{
   constructor(props, context) {
      super(props, context);
      this.state = {
         name: props.name,
      };
   }
   componentDidMount(){}
   render() {
      return (
         <div>
            <h1>Hello: {this.state.name}</h1>
         </div>
      )
   }
}
