class Body extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            fruits: []
        };
    }
    componentDidMount(){
        fetch('/api/v1/fruits.json')
            .then((response) => {return response.json()})
            .then((data) => {this.setState({ fruits: data }) });
    }
    render(){
        return(
            <div>
                <AllFruits fruits={this.state.fruits} />
            </div>
        )
    }
    const AllFruits = (props) => {
        var fruits = props.fruits.map((fruit) => {
            return(
                <div key={fruit.id}>
                    <h1>{fruit.name}</h1>
                    <p>{fruit.description}</p>
                </div>
            )
        })
        return(
            <div>
                {fruits}
            </div>
        )
    }
    const Main = (props) => {
        return(
            <div>
                <h1>Fruits are great!</h1>
                <Body />
            </div>
        )
    }

}