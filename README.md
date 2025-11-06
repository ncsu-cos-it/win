# NC State University - COS IT
## Initial Install
<ol>
 <li>Install Git for Windows </li>
 <ul>
    <li<a href="https://git-scm.com/download/win">https://git-scm.com/download/win</a></li>
 </ul>
 <li>{Press} &lt;WinLogo&gt;&lt;R&gt;</li>
 <li>{Type} cmd </li>
 <li>{Type in Command (Black) Window}
 <li>md \opt</li>
 <li>cd \opt</li>
 <li>git clone https://github.com/ncsu-cos-it/win cos</li>
 <li>cd cos/info</li>
 <li>01-COS-config</li>
 <li>exit</li>
 <li>{Press} &lt;WinLogo&gt;&lt;R&gt;</li>
 <li>{Type} powershell (Click Run as adminstrator)</li> 
 <li>{Type in PowerShell Window}</li>
 <li>Get-ExecutionPoolicy -list</li>
 <li>Set-ExecutionPolicy Bypass -scope LocalMachine -force</li>
 <li>Get-ExecutiionPolicy -list</li>
 <li>sn-set.ps1</li>
 <li>exit</li>
</ol>

## Manual Config SN/TAG
<ol>
 <li>{Press} &lt;WinLogo&gt;&lt;R&gt;</li>
 <li>{Type} cmd </li>
 <li>{Type in Command (Black) Window}</li>
 <li>cd \opt\cos\info</li>
 <li>notepad SN.txt<br>
  (Type whatever seriall number you have for computer)</li>
 <li>notepad Tag.txt<br>
  (Type whatever asset tag you have for computer.)</li>
</ol>

## Update
<ol>
 <li>{Press} &lt;WinLogo&gt;&lt;R&gt;</li>
 <li>{Type} cmd </li>
 <li>{Type in Command (Black) Window}
 <li>cd \opt\cos</li>
 <li>git pull</li>
 <li>exit</li>
</ol>

## Contact
<a href="mailto:tbyron@ncsu.edu">tbyron@ncsu.edu</a><br>
