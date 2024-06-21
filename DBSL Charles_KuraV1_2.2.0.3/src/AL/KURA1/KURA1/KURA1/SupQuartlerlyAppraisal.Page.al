#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56207 "Sup Quartlerly Appraisal"
{
    Caption = 'Supervisor Quartlerly Appraisal';
    PageType = Card;
    SourceTable = "Quarterly Appraisal";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Date created";"Date created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created";"Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Quarter;Quarter)
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year";"Financial Year")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Quartely score";"Overall Quartely score")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Assignment";ObjText)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        CalcFields("Additional Assignment");
                        "Additional Assignment".CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText<>Format(Obj) then
                        begin
                         Clear("Additional Assignment");
                         Clear(Obj);
                         Obj.AddText(ObjText);
                         "Additional Assignment".CreateOutstream(ObjOutStr);
                         Obj.Write(ObjOutStr);
                         //MODIFY;
                        end;
                    end;
                }
                field(Remarks;ObjText2)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        CalcFields(Remarks);
                        Remarks.CreateInstream(ObjInstr2);
                        Obj2.Read(ObjInstr2);

                        if ObjText2<>Format(Obj2) then
                        begin
                         Clear(Remarks);
                         Clear(Obj2);
                         Obj2.AddText(ObjText2);
                         Remarks.CreateOutstream(ObjOutStr2);
                         Obj2.Write(ObjOutStr2);
                         //MODIFY;
                        end;
                    end;
                }
                field("Supervisor Code";"Supervisor Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Supervisor Name";"Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Supervisor Designation";"Supervisor Designation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control22;"Quarterly Appraisal Lines")
            {
                SubPageLink = "Appraisal No"=field(No);
            }
        }
        area(factboxes)
        {
            systempart(Control21;Notes)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send to the Supervisor")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    Status := Status::"Sent to supervisior";
                    Modify;
                end;
            }
        }
    }

    var
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        Obj2: BigText;
        ObjInstr2: InStream;
        ObjOutStr2: OutStream;
        ObjText2: Text;
}

