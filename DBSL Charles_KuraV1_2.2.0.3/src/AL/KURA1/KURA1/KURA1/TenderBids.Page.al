#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70032 "Tender Bids"
{
    PageType = List;
    SourceTable = "Tender Bids";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor No";"Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field(Selected;Selected)
                {
                    ApplicationArea = Basic;
                }
                field("Linked vendor";"Linked vendor")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition No";"Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Name";"Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Price";"Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Amount LCY";"Amount LCY")
                {
                    ApplicationArea = Basic;
                }
                field(Discount;Discount)
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
        area(processing)
        {
            action("Proceed to Award?")
            {
                ApplicationArea = Basic;
                Image = WorkCenterLoad;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    rec5: Record "Procurement Request";
                    rec7: Record Bidders;
                begin
                     /*  rec5.RESET;
                       rec5.GET("Requisition No");
                      IF rec5."In Award?"=TRUE THEN BEGIN
                        ERROR('The Quotation is already in award stage!');
                      END;/*/
                    rec5.Reset;
                    rec5.Get("Requisition No");
                    //Rec.RESET;
                    //rec.SETRANGE("Requisition No",No);
                    Rec.SetRange(Selected,true);
                    Rec.SetFilter(Amount,'<>%1',0);
                    if Rec.FindSet then begin
                     //MESSAGE('Financial Evaluation can begin in a separate Menu..');
                          rec5.Reset;
                       rec5.Get("Requisition No");
                       rec5."In Technical?":=true;
                       rec5."In Financial?":=true;
                       rec5."In Award?":=true;
                       rec5."Pending LPO?":=true;
                       rec5.Modify;
                       Message('Please Proceed in a separate Window');
                       CurrPage.Close;
                    end;
                    if not Rec.FindSet then begin
                       Error('Please Fill in the Financial Amount(s).!!!');
                    end;

                end;
            }
        }
    }
}

