#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70068 "Award Quotation Evaluation"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Quotations Evaluation";
    SourceTableView = where(created=const(true),
                            "Financial Amount"=filter(>0));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Ref No.";"Ref No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Passes Technical?";"Passes Technical?")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Item Description";"Item Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Financial Amount";"Financial Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Linked vendor";"Linked vendor")
                {
                    ApplicationArea = Basic;
                }
                field("Quotation Awarded?";"Quotation Awarded?")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    var
                        countno: Integer;
                        rec61: Record "Quotations Evaluation";
                        Workplanrec: Record "Procurement Plan1";
                        perec: Record "Procurement Plan1";
                        procrec: Record "Procurement Plan1";
                    begin
                        if "Quotation Awarded?"=true then begin
                            rec5.Reset;
                            rec5.SetFilter(rec5."Requisition No","Ref No.");
                            rec5.SetFilter(rec5.Description,'<>%1','');
                            if rec5.FindSet then      repeat
                                               countno:=1;
                                               rec61.Reset;
                                               rec61.SetRange(rec61."Item Description","Item Description");
                                               rec61.SetRange(rec61."Ref No.","Ref No.");
                                               rec61.SetRange(rec61."Quotation Awarded?",true);
                                               if rec61.FindSet then repeat
                                                  countno+=1;
                                               until rec61.Next=0;
                                              // message('%1',countno);

                                               if countno>1 then begin
                                                  Error('Item: %1 has been Awarded More than Once!!!',rec5.Description);
                                               end;
                                               if "Item Description"=rec5.Description then begin
                                                      if "Linked vendor"='' then begin
                                                         Error('Please Input a Linked Vendor');
                                                      end;
                                                      if "Financial Amount">rec5.Amount then begin
                                                         Error('The Quoted Amount is more than the Requisition Figure of %1!!!',rec5.Amount,rec5.Description);
                                                      end;
                                               end;
                                            until rec5.Next=0;
                        end;
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Awarded Quotations")
            {
                ApplicationArea = Basic;
                Caption = 'Move to Awarded Quotations';
                Image = Pause;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    rec6.Reset;
                    rec6.SetFilter(rec6.No,"Ref No.");
                    if rec6.FindSet then begin
                       if rec6."Pending LPO?"=true then begin
                          Error('This quotation has already been awarded. Please find it in Awarded Quotations !!');
                       end;
                    end;


                    rec5.Reset;
                    rec5.SetFilter(rec5."Requisition No","Ref No.");
                    rec5.SetFilter(rec5.Description,'<>%1','');
                    if rec5.FindSet then repeat
                       Rec.SetRange("Item Description",rec5.Description);
                       //Rec.SETFILTER("Financial Amount",'<>%1',0);
                       Rec.SetFilter("Ref No.",rec5."Requisition No");
                       Rec.SetFilter("Quotation Awarded?",'%1',true);
                       if Rec.FindSet then repeat
                          if "Financial Amount"=0 then begin
                              Error('Some Line(s) do not have Amount Field!!!');
                          end;
                       until Rec.Next=0;
                    until rec5.Next=0;

                    rec6.Reset;
                    rec6.SetFilter(rec6.No,"Ref No.");
                    if rec6.FindSet then begin
                       rec6."Pending LPO?":=true;
                       rec6.Modify;
                    end;
                    Message('Moved to Quotations Awarded Quotations...');
                    CurrPage.Close;
                end;
            }
        }
    }

    var
        rec5: Record "Procurement Request Lines";
        rec6: Record "Procurement Request";
}

