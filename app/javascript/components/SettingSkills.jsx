import React from "react"

class SettingSkills extends React.Component {
    constructor(props) {
        super(props);
        this.state={
            deleteSkillId: '0',
            addSkillId: '0',
            disabledDeleteSkill: 'disabled',
            disabledAddSkill: 'disabled',
            isVisibleSkillList: false,
            skills: this.props.skills,
            skillLists: []
        };
    }

    onClickDeleteSkill(){

    }

    onClickAddSkill(){
        fetch('/settings/skills/add-skill', {
            method: 'POST',
            body: JSON.stringify({
                skill_id: this.state.addSkillId,
                level: 1
            }),
            headers: {
                'Content-Type': 'application/json'
            }
        }).then((response)=>{
            return response.json()
        }).then((result)=>{
            let data = result
            this.setState({skills: data});
        });
    }

    onClickSkillList(name){
        document.getElementById('setting-new-skill').value = name;
        this.onChangeNewSkill();
    }

    onChangeNewSkill(){
        let value = document.getElementById('setting-new-skill').value;
        if(value === ''){
            this.setState({skillLists:[]});
            this.setState({isVisibleSkillList: false});
        }else {
            fetch('/settings/skills/get-skill', {
                method: 'POST',
                body: JSON.stringify({
                    name: value
                }),
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then((response) => {
                return response.json()
            }).then((result) => {
                let data = result;
                if (Array.isArray(data)) {
                    this.setState({addSkillId: '0'});
                    this.setState({disabledAddSkill: 'disabled'});
                    this.setState({skillLists: data});
                    this.setState({isVisibleSkillList: true});
                } else {
                    this.setState({addSkillId: data.id});
                    this.setState({disabledAddSkill: ''});
                    this.setState({isVisibleSkillList: false});
                }
            });
        }
    }

    render () {
        let skillList;
        if(this.state.isVisibleSkillList){
            skillList = (
                <ul>
                    {
                        this.state.skillLists.map((skill)=>(
                            <li>
                                <button onClick={()=>(this.onClickSkillList(skill.name))}>{skill.name}</button>
                            </li>
                        ))
                    }
                </ul>
            )
        }
        return (
            <div className={'skillset-form'}>
                <h3>現在のスキルセット</h3>
                <div>
                    {
                        this.state.skills.map((skill)=>(
                            <button>{skill.skill_id}</button>
                        ))
                    }
                </div>
                <button className={'delete-skill'} disabled={this.state.disabledDeleteSkill} onClick={()=>{this.onClickDeleteSkill()}}>消去</button>
                <h3>スキルを追加</h3>
                <input type={'text'} id={'setting-new-skill'} name={'new-skill'} style={{width: '200px'}} onChange={()=>{this.onChangeNewSkill()}}/>
                {skillList}
                <button className={'add-skill'} disabled={this.state.disabledAddSkill} onClick={()=>{this.onClickAddSkill()}}>追加</button>
            </div>
        );
    }
}

export default SettingSkills
