#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72711 "Project Monthly Progress List"
{
    PageType = ListPart;
    RefreshOnActivate = true;
    SourceTable = "Job Monthly Progress";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No";"Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field("Month Name";"Month Name")
                {
                    ApplicationArea = Basic;
                }
                field("KM of Tarmac Done";"KM of Tarmac Done")
                {
                    ApplicationArea = Basic;
                    Visible = KMDoneVisible;
                }
                field("No of KM Designed";"No of KM Designed")
                {
                    ApplicationArea = Basic;
                    Visible = KMDesgnedVisible;
                }
                field("No of Structures Completed";"No of Structures Completed")
                {
                    ApplicationArea = Basic;
                    Visible = Structuresvisible;
                }
                field("No of Men Employed";"No of Men Employed")
                {
                    ApplicationArea = Basic;
                }
                field("No of Women Employed";"No of Women Employed")
                {
                    ApplicationArea = Basic;
                }
                field("Men Mandays";"Men Mandays")
                {
                    ApplicationArea = Basic;
                }
                field("Women Mandays";"Women Mandays")
                {
                    ApplicationArea = Basic;
                }
                field("Updated By";"Updated By")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        Structuresvisible:=true;
        KMDesgnedVisible:=true;
        KMDoneVisible:=true;

        ObjJob.Reset;
        ObjJob.SetRange(ObjJob."No.","Job No");
        if ObjJob.FindSet then begin
        if ObjJob."Type of Project"=ObjJob."type of project"::"Survey/Study" then begin
          Structuresvisible:=false;
          KMDoneVisible:=false;
          end;
        if ((ObjJob."Type of Project"=ObjJob."type of project"::Maintenance) or (ObjJob."Type of Project"=ObjJob."type of project"::"Road Construction")) then begin
         Structuresvisible:=false;
          end;
        if ObjJob."Type of Project"=ObjJob."type of project"::"Structure Construction" then begin
          KMDesgnedVisible:=false;
          KMDoneVisible:=false;
          end;
          end;
    end;

    trigger OnAfterGetRecord()
    begin
        Structuresvisible:=true;
        KMDesgnedVisible:=true;
        KMDoneVisible:=true;

        ObjJob.Reset;
        ObjJob.SetRange(ObjJob."No.","Job No");
        if ObjJob.FindSet then begin
        if ObjJob."Type of Project"=ObjJob."type of project"::"Survey/Study" then begin
          Structuresvisible:=false;
          KMDoneVisible:=false;
          end;
        if ((ObjJob."Type of Project"=ObjJob."type of project"::Maintenance) or (ObjJob."Type of Project"=ObjJob."type of project"::"Road Construction")) then begin
         Structuresvisible:=false;
          end;
        if ObjJob."Type of Project"=ObjJob."type of project"::"Structure Construction" then begin
          KMDesgnedVisible:=false;
          KMDoneVisible:=false;
          end;
          end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        //CurrPage.UPDATE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //CurrPage.UPDATE;
    end;

    trigger OnOpenPage()
    begin
        Structuresvisible:=true;
        KMDesgnedVisible:=true;
        KMDoneVisible:=true;

        ObjJob.Reset;
        ObjJob.SetRange(ObjJob."No.","Job No");
        if ObjJob.FindSet then begin
        if ObjJob."Type of Project"=ObjJob."type of project"::"Survey/Study" then begin
          Structuresvisible:=false;
          KMDoneVisible:=false;
          end;
        if ((ObjJob."Type of Project"=ObjJob."type of project"::Maintenance) or (ObjJob."Type of Project"=ObjJob."type of project"::"Road Construction")) then begin
         Structuresvisible:=false;
          end;
        if ObjJob."Type of Project"=ObjJob."type of project"::"Structure Construction" then begin
          KMDesgnedVisible:=false;
          KMDoneVisible:=false;
          end;
          end;
    end;

    var
        Structuresvisible: Boolean;
        KMDoneVisible: Boolean;
        KMDesgnedVisible: Boolean;
        ObjJob: Record Job;
}

