#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56107 "Case Plantiffs"
{
    PageType = List;
    SourceTable = "Case Plantiff-Defandants";
    SourceTableView = where(Type=const(Plaintiff));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case No";"Case No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Names;Names)
                {
                    ApplicationArea = Basic;
                }
                field(Contacts;Contacts)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type:=Type::Plaintiff;
    end;
}

