unit UEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI;

type
  TForm2 = class(TForm)
    conexion: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    DBGrid1: TDBGrid;
    CBDB: TComboBox;
    LBTablas: TListBox;
    Label1: TLabel;
    LBColumnas: TListBox;
    MemoSentencias: TMemo;
    BtnOK: TButton;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure CBDBChange(Sender: TObject);
    procedure LBTablasClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.BtnOKClick(Sender: TObject);
begin
FDquery1.Close;
FDquery1.sql:=MemoSentencias.Lines;
FDquery1.Open;

end;

procedure TForm2.CBDBChange(Sender: TObject);
var
 i:integer;
 cad,mitabla:String;
begin
   i:=CBDB.ItemIndex;
   cad:=CBDB.Items.Strings[i];
   FDquery1.Close;
   conexion.Connected:=false;
   conexion.Params.Database:=cad+'.db';
   //FDConnection1.Params.Add( 'Database='+cad+'.db');
   conexion.Connected:=true;
   LBTablas.Clear;
   conexion.GetTableNames('','','',LBTablas.Items,[osMy],[tkTable],true);
   LBTablas.Selected[0]:=true;
   mitabla:=LBTablas.Items.Strings[0];
   FDquery1.SQL.Text:='Select * from '+mitabla;
   FDQuery1.GetFieldNames(LBColumnas.Items);
   FDquery1.Open;


end;

procedure TForm2.FormActivate(Sender: TObject);
begin
 conexion.GetTableNames('','','',LBTablas.Items,[osMy],[tkTable],true);
 FDQuery1.GetFieldNames(LBColumnas.Items);
 LBTablas.Selected[0]:=true;
 conexion.Connected:=true;
 FDQuery1.Open();

end;

procedure TForm2.LBTablasClick(Sender: TObject);
var
 i:integer;
 cad:String;
begin
  i:=LBTablas.ItemIndex;
  cad:=LBTablas.Items.Strings[i];
  FDQuery1.Close;
  FDQuery1.SQL.Text:='Select * from '+cad;
  FDQuery1.GetFieldNames(LBColumnas.Items);
  FDQuery1.Open();


end;

end.
