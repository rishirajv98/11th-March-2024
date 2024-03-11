import { LightningElement } from 'lwc';
import LightningAlert from 'lightning/alert';

import iplBackGroundImage from '@salesforce/resourceUrl/IPLBackGroundImage';
import cskTeamLogo from '@salesforce/resourceUrl/CSKLogo';
import dkTeamLogo from '@salesforce/resourceUrl/DKLogo';
import gtTeamLogo from '@salesforce/resourceUrl/GTLogo';
import kkrTeamLogo from '@salesforce/resourceUrl/KKRLogo';
import kxipTeamLogo from '@salesforce/resourceUrl/KXIPLogo';
import rcbTeamLogo from '@salesforce/resourceUrl/RCBLogo';
import rrTeamLogo from '@salesforce/resourceUrl/RRLogo';
import srTeamLogo from '@salesforce/resourceUrl/SRLogo';
import miTeamLogo from '@salesforce/resourceUrl/MILogo';
import lsgTeamLogo from '@salesforce/resourceUrl/LSGLogo';

export default class IplSite extends LightningElement {

    imageUrl = `background-image: url(${iplBackGroundImage}); background-size: cover; background-position: center;`;
    cskLogo = cskTeamLogo;
    dkLogo = dkTeamLogo;
    gtLogo = gtTeamLogo;
    kkrLogo = kkrTeamLogo;
    kxipLogo = kxipTeamLogo;
    rcbLogo = rcbTeamLogo;
    rrLogo = rrTeamLogo;
    srLogo = srTeamLogo;
    miLogo = miTeamLogo;
    lsgLogo = lsgTeamLogo;
}