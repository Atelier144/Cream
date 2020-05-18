import React from "react"

class HeaderGuest extends React.Component {
    constructor(props) {
        super(props);
        this.state={
            visible: false,
            stylePulldownMenu: 'menu-enter'
        };
    }

    onClickHamburger(){
        this.setState({visible: !this.state.visible});
        if(this.state.visible){
            this.setState({stylePulldownMenu: 'menu-close'});
        }else{
            this.setState({stylePulldownMenu: 'menu-open-guest'});
        }
    }

    render () {
        let hamburgerButton;
        if(this.state.visible){
            hamburgerButton = (
                <i className="fas fa-times"></i>
            );
        }else{
            hamburgerButton = (
                <i className="fas fa-bars"></i>
            );
        }
        return (
            <header>
                <a className={'logo'} href={'/'}></a>
                <ul className={'header-menu'}>
                    <li>
                        <a href={'/'}>プロジェクト</a>
                    </li>
                    <li>
                        <a href={'/'}>ユーザー</a>
                    </li>
                    <li>
                        <a href={'/'}>ボード</a>
                    </li>
                </ul>
                <form action={'/'} className={'header-search'} method={'GET'}>
                    <input type={'text'} name={'content'} placeholder={'検索'}/>
                    <button type={'submit'}>
                        <i className={'fas fa-search'}></i>
                    </button>
                </form>
                <a href={'/login'} className={'login'} style={{right: '125px'}}>
                    ログイン
                </a>
                <a href={'/signup'} className={'login'} style={{right: '10px'}}>
                    新規登録
                </a>
                <button className={'hamburger'} onClick={()=>{this.onClickHamburger()}}>
                    {hamburgerButton}
                </button>
                <div className={`pulldown-menu ${this.state.stylePulldownMenu}`}>
                    <ul className={'main-menu'}>
                        <li>
                            <a href={'/'}>プロジェクト</a>
                        </li>
                        <li>
                            <a href={'/'}>ユーザー</a>
                        </li>
                        <li>
                            <a href={'/'}>ボード</a>
                        </li>
                    </ul>
                </div>
            </header>
        );
    }
}

export default HeaderGuest
