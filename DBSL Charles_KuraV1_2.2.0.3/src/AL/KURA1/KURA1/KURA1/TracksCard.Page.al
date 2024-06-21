#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56083 "Tracks Card"
{
    PageType = Card;
    SourceTable = Tracks;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Copyright No";"Copyright No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Copyright Title";"Copyright Title")
                {
                    ApplicationArea = Basic;
                }
                field("Track Title";"Track Title")
                {
                    ApplicationArea = Basic;
                }
                field("Track Work Category";"Track Work Category")
                {
                    ApplicationArea = Basic;
                }
                field("Track Work SubCategory";"Track Work SubCategory")
                {
                    ApplicationArea = Basic;
                }
                field("Track Category Description";"Track Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("Track SubCategory Desc";"Track SubCategory Desc")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Fixation/Reduction";"Date of Fixation/Reduction")
                {
                    ApplicationArea = Basic;
                }
                field("Track Works Abstract";ObjText)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;

                    trigger OnValidate()
                    begin
                        CalcFields("Track Work Abstract");
                        "Track Work Abstract".CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText<>Format(Obj) then
                        begin
                         Clear("Track Work Abstract");
                         Clear(Obj);
                         Obj.AddText(ObjText);
                         "Track Work Abstract".CreateOutstream(ObjOutStr);
                         Obj.Write(ObjOutStr);

                        end;
                    end;
                }
                field("Track Language";"Track Language")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Production Details")
            {
                field("Prod/Pub Name";"Prod/Pub Name")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub ID No/Company Reg No";"Prod/Pub ID No/Company Reg No")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub P.I.N";"Prod/Pub P.I.N")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment/License Date";"Assignment/License Date")
                {
                    ApplicationArea = Basic;
                }
                field("1st Country of Production";"1st Country of Production")
                {
                    ApplicationArea = Basic;
                }
                field("Production Category";"Production Category")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub Phone No.";"Prod/Pub Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub Email";"Prod/Pub Email")
                {
                    ApplicationArea = Basic;
                }
                field("Producer Address";"Producer Address")
                {
                    ApplicationArea = Basic;
                }
                field("Producer Post Code";"Producer Post Code")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Other Persons")
            {
                Caption = 'Other Persons';
                part(Control24;"Tracks Other Persons")
                {
                    SubPageLink = Copyright=field("Copyright No"),
                                  "Tracks No"=field("Line No");
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        CalcFields("Track Work Abstract");
        "Track Work Abstract".CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText:=Format(Obj);
    end;

    var
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
}

