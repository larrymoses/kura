#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70025 "Quotation List"
{
    ApplicationArea = Basic;
    Caption = 'New Quotation';
    CardPageID = Quotation;
    Editable = false;
    PageType = List;
    SourceTable = "Procurement Request";
    SourceTableView = where("Process Type"=const(RFQ),
                            Status=filter(Open));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Title;Title)
                {
                    ApplicationArea = Basic;
                }
                field("Requisition No";"Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan No";"Procurement Plan No")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date";"Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("User ID";"User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method";"Procurement Method")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

