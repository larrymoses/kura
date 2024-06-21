#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57244 "Approved Agency Notices"
{
    CardPageID = "Agency Notice";
    PageType = List;
    SourceTable = "Agency Notice Header";
    SourceTableView = where(Status=const(Released));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Notice Date";"Notice Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No";"Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date Time";"Created Date Time")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field(Lifted;Lifted)
                {
                    ApplicationArea = Basic;
                }
                field("Payment Registration Number";"Payment Registration Number")
                {
                    ApplicationArea = Basic;
                }
                field("Obligation WHT";"Obligation WHT")
                {
                    ApplicationArea = Basic;
                }
                field("Obligation VAT";"Obligation VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Obligation Income Tax";"Obligation Income Tax")
                {
                    ApplicationArea = Basic;
                    Caption = 'Obligation PAYE';
                }
                field("Obligation Total Amount";"Obligation Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field("Project No";"Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor PIN";"Contractor PIN")
                {
                    ApplicationArea = Basic;
                }
                field("Reference No";"Reference No")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        DMSManagement: Codeunit "DMS Management";
}

