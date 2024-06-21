#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72439 "Daily Work Record Materials"
{
    CardPageID = "Daily Work Record Material";
    PageType = List;
    SourceTable = "Daily Work Record Material";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Movement Type";"Movement Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Material ID";"Material ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Base Unit of Measure";"Base Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Photo No.";"Photo No.")
                {
                    ApplicationArea = Basic;
                }
                field("Material Test Record ID";"Material Test Record ID")
                {
                    ApplicationArea = Basic;
                }
                field("Reasons for Removal";"Reasons for Removal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Where Material was Utilized';
                    Visible = reasonsforremovalisvisible;
                }
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        reasonsforremovalisvisible:=false;
        if "Movement Type" in ["movement type"::"Removed From Site"] then begin
          reasonsforremovalisvisible:=true;
          end;
    end;

    trigger OnOpenPage()
    begin
        reasonsforremovalisvisible:=false;
        if "Movement Type" in ["movement type"::"Removed From Site"] then begin
          reasonsforremovalisvisible:=true;
          end;
    end;

    var
        reasonsforremovalisvisible: Boolean;
}

