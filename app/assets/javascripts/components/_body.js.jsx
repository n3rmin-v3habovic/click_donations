class Body extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            fruits: []

        };
        this.handleUpdate = this.handleUpdate.bind(this);
        this.updateFruit = this.updateFruit.bind(this)

    }
    handleUpdate(fruit){
        fetch(`http://localhost:3000/api/v1/fruits/${fruit.id}`,
            {
                method: 'PUT',
                body: JSON.stringify({fruit: fruit}),
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then((response) => {
            this.updateFruit(fruit)
        })
    }
    updateFruit(fruit){
        let newFruits = this.state.fruits.filter((f) => f.id !== fruit.id)
        newFruits.push(fruit)
        this.setState({
            fruits: newFruits
        })
    }

    componentDidMount(){
        fetch('/api/v1/items.json')
            .then((response) => {return response.json()})
            .then((data) => {this.setState({ items: data }) });
    }


    render(){
        return(
            <div>
                <NewFruit handleFormSubmit={this.handleFormSubmit}/>
                <AllFruits fruits={this.state.fruits} handleDelete=
                    {this.handleDelete}handleUpdate = {this.handleUpdate}/>
            </div>
        )
    }
}