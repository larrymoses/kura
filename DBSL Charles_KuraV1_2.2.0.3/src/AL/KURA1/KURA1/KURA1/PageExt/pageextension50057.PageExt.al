#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50057 "pageextension50057" extends "Purchases & Payables Setup"
{
    layout
    {
        // modify("Background Posting")
        // {

        //     //Unsupported feature: Property Modification (Level) on ""Background Posting"(Control 7)".


        //     //Unsupported feature: Property Modification (ControlType) on ""Background Posting"(Control 7)".


        //     //Unsupported feature: Property Modification (Name) on ""Background Posting"(Control 7)".


        //     //Unsupported feature: Property Insertion (SourceExpr) on ""Background Posting"(Control 7)".

        //    // ApplicationArea = Basic;
        // }

        //Unsupported feature: Property Deletion (CaptionML) on ""Background Posting"(Control 7)".


        //Unsupported feature: Property Deletion (GroupType) on ""Background Posting"(Control 7)".
        addlast("Default Accounts")
        {
            field("Director's Vendor Type";Rec."Director's Vendor Type")
            {
             ApplicationArea = Basic;   
            }
        }

        addafter("Ignore Updated Addresses")
        {
            field("Current Year"; Rec."Current Year")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Posted Prepmt. Cr. Memo Nos.")
        {
            field("Store Requisition Nos."; Rec."Store Requisition Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Inspection Nos"; Rec."Inspection Nos")
            {
                ApplicationArea = Basic;
            }
            field("Special RFQ Prcmnt Nos"; Rec."Special RFQ Prcmnt Nos")
            {
                ApplicationArea = Basic;
            }
            group(Procurement)
            {
                Caption = 'Procurement';
                field("Procument Plan Nos"; Rec."Procument Plan Nos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Procument Plan Nos';
                }
                field("Request for Quotation Nos."; Rec."Request for Quotation Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("PM E-mail"; Rec."PM E-mail") { ApplicationArea = Basic; }
                FIELD("Procurement/Stores E-mail"; Rec."Procurement/Stores E-mail")
                {
                    ApplicationArea = Basic;

                }
                field("Request for Proposals Nos."; Rec."Request for Proposals Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Tenders Nos"; Rec."Tenders Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Expression of Interest Nos."; Rec."Expression of Interest Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Direct Prcmnt Nos"; Rec."Direct Prcmnt Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Low Value Prcmnt Nos"; Rec."Low Value Prcmnt Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Nos."; Rec."Requisition Nos.")
                {
                    ApplicationArea = Basic;
                }


            }
        }
        addafter("Notify On Success")
        {
            field("Contract Nos"; Rec."Contract Nos")
            {
                ApplicationArea = Basic;
            }
            field("Purchase Requisition Nos."; Rec."Purchase Requisition Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Asset Disposal Nos"; Rec."Asset Disposal Nos")
            {
                ApplicationArea = Basic;
            }
            field("RFP Documents Path"; Rec."RFP Documents Path")
            {
                ApplicationArea = Basic;
            }
            field("RFQ Documents Path"; Rec."RFQ Documents Path")
            {
                ApplicationArea = Basic;
            }
            field("Direct Documents Path"; Rec."Direct Documents Path")
            {
                ApplicationArea = Basic;
            }
            field(ObjText; ObjText)
            {
                ApplicationArea = Basic;
                MultiLine = true;

                trigger OnValidate()
                begin
                    Rec.CalcFields("Order Conditions");
                    Rec."Order Conditions".CreateInstream(ObjInstr);
                    Obj.Read(ObjInstr);

                    if ObjText <> Format(Obj) then begin
                        Clear(Rec."Order Conditions");
                        Clear(Obj);
                        Obj.AddText(ObjText);
                        Rec."Order Conditions".CreateOutstream(ObjOutStr);
                        Obj.Write(ObjOutStr);
                        //MODIFY;
                    end;
                end;
            }
        }
    }

    var
        OrderConditions: BigText;
        Instr: InStream;
        OutStr: OutStream;
        OrderConditionsTxt: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //begin
    /*
    CALCFIELDS("Order Conditions");
    "Order Conditions".CREATEINSTREAM(ObjInstr);
    Obj.READ(ObjInstr);
    ObjText:=FORMAT(Obj);
    */
    //end;
}

#pragma implicitwith restore

