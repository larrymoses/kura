#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72582 "Inspection Corrective Orders"
{
    PageType = List;
    SourceTable = "Project Inspection Section";
    SourceTableView = where("Section Type"=filter("Corrective Order"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inpection Type";"Inpection Type")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection No";"Inspection No")
                {
                    ApplicationArea = Basic;
                }
                field("Section Type";"Section Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Responsibility;Responsibility)
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
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
        "Section Type":="section type"::"Corrective Order";
    end;
}

