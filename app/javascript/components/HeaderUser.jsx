import React from "react"

class HeaderUser extends React.Component {
    constructor(props) {
        super(props);
        this.state={
            isVisiblePulldownMenu: false,
            isVisiblePopupMenu: false,
            hamburgerStyle: 'fas fa-bars'
        };
    }

    onClickHamburger(){
        this.setState({isVisiblePulldownMenu: !this.state.isVisiblePulldownMenu});
        if(this.state.isVisiblePulldownMenu){
            this.setState({stylePulldownMenu: 'menu-close'});
            this.setState({hamburgetStyle: 'fas fa-times'});
        }else{
            this.setState({stylePulldownMenu: 'menu-open-user'});
            this.setState({hamburgerStyle: 'fas fa-bars'});
        }
    }

    onClickButtonHeaderUserImage(){
        this.setState({isVisiblePopupMenu: !this.state.isVisiblePopupMenu});
    }

    render () {
        let hamburger;
        let popupMenu;
        if(this.state.isVisiblePopupMenu){
            popupMenu = (
                <form action={'/logout'} method={'POST'} className={'popup-menu'}>
                    <div className={'user-name'}>
                        {this.props.user.name}
                    </div>
                    <ul>
                        <li>
                            <a href={'/'}>
                                <span className={'menu-icon'}><i className="far fa-bell"></i></span>招待リクエスト（0件）
                            </a>
                        </li>
                        <li>
                            <a href={'/'}>
                                <span className={'menu-icon'}><i className="fas fa-users"></i></span>参加中のプロジェクト
                            </a>
                        </li>
                        <li>
                            <a href={'/'}>
                                <span className={'menu-icon'}><i className="far fa-address-card"></i></span>プロフィール
                            </a>
                        </li>
                        <li>
                            <a href={'/'}>
                                <span className={'menu-icon'}><i className="fas fa-users-cog"></i></span>プロジェクト設定
                            </a>
                        </li>
                        <li>
                            <a href={'/settings/profile'}>
                                <span className={'menu-icon'}><i className="fas fa-user-cog"></i></span>アカウント設定
                            </a>
                        </li>
                        <li>
                            <button type={'submit'}>
                                <span className={'menu-icon'}><i className="fas fa-sign-out-alt"></i></span>ログアウト
                            </button>
                        </li>
                    </ul>
                </form>
            )
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
                <a href={'/'} className={'new-project'}>
                    新規プロジェクト
                </a>
                <button className={'header-user-image'} onClick={()=>{this.onClickButtonHeaderUserImage()}}>
                    <img src={this.props.user.image.url}/>
                </button>
                <button className={'hamburger'} onClick={()=>{this.onClickHamburger()}}>
                    <i className={this.state.hamburgerStyle}></i>
                </button>
                {popupMenu}
            </header>
        );
    }
}

export default HeaderUser
