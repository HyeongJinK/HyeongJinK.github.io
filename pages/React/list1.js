// npm i -g http-server
// npx http-server
// React.Component를 상속받아 컴포넌트를 만든다.
class BoardList extends React.Component {
    constructor(props) { //props로 값을 받아온다.
        super(props);
        this.state = { list: boardData.data }; // 상태를 저장한다.
    }

    render() {
        const {list} = this.state;
        
        return (
            <React.Fragment>
                <ul>
                    {list.map((item, i) => (<li key={i}>{item.title}</li>))}
                </ul>
            </React.Fragment>
        );
    }
}

const domContainer = document.querySelector('#container');
ReactDOM.render(React.createElement(BoardList), domContainer);