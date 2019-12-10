class AllFruits extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            fruits: []
        };
    }

    componentDidMount() {
        fetch('/api/v1/fruits.json')
            .then((response) => {
                return response.json()
            })
            .then((data) => {
                this.setState({fruits: data})
            });
    }

    render() {
        return (
            <div>
                <h1>To do: List of fruits</h1>
            </div>
        )
    }

    render() {
        const AllFruits = (props) => {
            var fruits = props.fruits.map((fruit) => {
                return (
                    <div key={fruit.id}>
                        <Fruit fruit={fruit} handleDelete={props.handleDelete}
                               handleUpdate={props.handleUpdate}/>
                    </div>
                )
            })
            return (
                <div>
                    {fruits}
                </div>
            )
        }
    }
}