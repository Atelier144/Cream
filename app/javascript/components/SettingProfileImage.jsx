import React from "react"
import PropTypes from "prop-types"
class SettingProfileImage extends React.Component {
    constructor(props) {
        super(props);
        this.state={
            userImage: this.props.userImage,
            defaultButtonText: 'デフォルトに戻す'
        };
    }

    onClickSelectFile(){
        document.getElementById('setting-user-image').click();
    }

    onClickDefault(){
        let userImage = document.getElementById('setting-user-image');
        let defaultImage = document.getElementById('setting-default-image');
        if(defaultImage.checked){
            defaultImage.checked = false;
            this.setState({userImage: this.props.userImage});
            this.setState({defaultButtonText: 'デフォルトに戻す'});
        }else{
            defaultImage.checked = true;
            this.setState({userImage: '/assets/NoUserImage.png'});
            this.setState({defaultButtonText: 'デフォルト解除'});
        }
        userImage.value = '';
    }

    onChangeImageFile(e){
        let createObjectURL = (window.URL || window.webkitURL).createObjectURL || window.createObjectURL;
        let files = e.target.files;
        if(files.length === 0){
            this.setState({userImage: this.props.userImage});
        }else{
            this.setState({userImage: createObjectURL(files[0])});
        }
        document.getElementById('setting-default-image').checked = false;
        this.setState({defaultButtonText: 'デフォルトに戻す'});
    }
    render () {
        return (
            <div className={'edit-user-image'}>
                <img src={this.state.userImage}/>
                <button type={'button'} onClick={()=>{this.onClickSelectFile()}}>
                    ファイルを選択
                </button>
                <button type={'button'} onClick={()=>{this.onClickDefault()}}>
                    {this.state.defaultButtonText}
                </button>
                <input type={'file'} name={'image'} style={{display: 'none'}} id={'setting-user-image'} onChange={(e)=>{this.onChangeImageFile(e)}}/>
                <input type={'checkbox'} name={'default_image'} style={{display: 'none'}} id={'setting-default-image'}/>
            </div>
        );
    }
}

export default SettingProfileImage;
