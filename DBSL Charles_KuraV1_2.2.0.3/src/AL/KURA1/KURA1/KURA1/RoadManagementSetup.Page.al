#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

Page 72137 "Road Management Setup"
{
    PageType = Card;
    SourceTable = "Road Management Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Current Road Authority Code"; Rec."Current Road Authority Code")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Legislation ID"; Rec."Primary Legislation ID")
                {
                    ApplicationArea = Basic;
                }

            }
            group("Number Series")
            {
                Caption = 'Number Series';
                field("RICS Existing Link No"; Rec."RICS Existing Link No")
                {
                    ApplicationArea = Basic;
                }
                field("RICS New Link No"; Rec."RICS New Link No")
                {
                    ApplicationArea = Basic;
                }
                field("Road Work Plan Nos(Maintenanc)"; Rec."Road Work Plan Nos(Maintenanc)")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Appointment Voucher Nos"; Rec."Staff Appointment Voucher Nos")
                {
                    ApplicationArea = Basic;
                }
                FIELD("PC Sum Request"; "PC Sum Request") { ApplicationArea = BASIC; }
                field("Measurement Sheet Nos"; Rec."Measurement Sheet Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Nos"; Rec."Inspection Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Certificate Nos"; Rec."Payment Certificate Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Commencement Order Nos"; Rec."Commencement Order Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Plan  Nos"; Rec."Work Execution Plan  Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Notice Of Completed Works Nos"; Rec."Notice Of Completed Works Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Payment Request Nos"; Rec."Contractor Payment Request Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Road Budget  Nos(Maintenance)"; Rec."Road Budget  Nos(Maintenance)")
                {
                    ApplicationArea = Basic;
                }
                field("Road Budget  Nos(Development)"; Rec."Road Budget  Nos(Development)")
                {
                    ApplicationArea = Basic;
                }

            }
            group("RAC No. Series")
            {
                field("Roadworks Budget Ceiling Nos"; Rec."Roadworks Budget Ceiling Nos")
                {
                    ApplicationArea = Basic;
                    visible = true;
                }

                field("RAM Workplan Nos(Regional)"; Rec."RAM Workplan Nos(Regional)")
                {
                    ApplicationArea = Basic;
                }
                field("RAM Workplan Nos(Consolidated)"; Rec."RAM Workplan Nos(Consolidated)")
                {
                    ApplicationArea = Basic;
                }
            }
            group("RAM No. Series")
            {
                field("Land Acquisition Workorder Nos"; Rec."Land Acquisition Workorder Nos")
                {
                    ApplicationArea = Basic;
                }
                field("GazettAcquisitionWorkorder Nos"; Rec."GazettAcquisitionWorkorder Nos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Gazette Acquisition Workorder Nos';
                }
            }
        }
    }

    actions
    {
    }
}



