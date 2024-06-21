#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72475 "Extension of Time Line"
{
    PageType = Card;
    SourceTable = "Extension of Time Line";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No.";"Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Original Planning Date";"Original Planning Date")
                {
                    ApplicationArea = Basic;
                }
                field("Extension Period (Days)";"Extension Period (Days)")
                {
                    ApplicationArea = Basic;
                }
                field("Revised Planning Date";"Revised Planning Date")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
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
        ProjectVariationHeader.Reset;
        ProjectVariationHeader.SetRange(ProjectVariationHeader."Document No.","Document No.");
        if ProjectVariationHeader.FindSet then begin
           "Job No.":=ProjectVariationHeader."Project ID";
          end;
    end;

    var
        ProjectVariationHeader: Record "Project Variation Header";
}

