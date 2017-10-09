import axios from 'axios'
import { getUrl } from '../tool/urlTool'
import qs from 'qs'
import { tool } from '../tool/tool'
import { baseUrl } from '../config/env'
import { setpromisePost, setpromiseGet, setpromiseDelete, setpromisePut } from './conf'
const HostName = baseUrl


export const saveMessage = (message) => {
    let url = HostName + 'message/' + createMtoken();
    console.info(JSON.stringify(message));
    return setpromisePost(url, message);
}