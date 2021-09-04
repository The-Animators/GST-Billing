<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Balancesheet extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function balancesheet($fromdate, $todate) {
        $fromtime = date('Y-m-01', strtotime($fromdate));
        $totime = date('Y-m-', strtotime($todate)) . cal_days_in_month(CAL_GREGORIAN, date('m', strtotime($todate)), date('Y', strtotime($todate)));
        $data['purchase'] = $this->db->select('sum(amttotal+taxtotal) as purchase')
                        ->from('purchasemaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("pdate BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->purchase;
        $data['sales'] = $this->db->select('(sum(total_amount)+sum(taxamount)) as cash')
                        ->from('salesmaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("invoice_date BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->cash;
        $data['cash'] = $this->db->select('(sum(total_amount)+sum(taxamount)) as cash')
                        ->from('salesmaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("paytype", "Cash")
                        ->get()->row()->cash;
        $data['credit'] = $this->db->select('(sum(total_amount)+sum(taxamount)) as cash')
                        ->from('salesmaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("paytype", "Credit")
                        ->get()->row()->cash;
        $data['advance'] = $this->db->select('sum(advance) as advance')
                        ->get('customermaster')->row()->advance;
        $data['dradvance'] = $this->db->select('sum(debit) as advance')
                        ->from('advancmaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("date BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->advance;
        $data['cradvance'] = $this->db->select('sum(credit) as creditt')
                        ->from('advancmaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("date BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->creditt;
        $data['dramount'] = $this->db->select('(sum(taxtotal)+sum(amttotal)) as amt')
                        ->from('debitnotemaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("ddate BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->amt;
        $data['dramountall'] = $this->db->select('(sum(taxtotal)+sum(amttotal)) as amt')
                        ->from('debitnotemaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->get()->row()->amt;
        $data['cramount'] = $this->db->select('(sum(totalamount)+sum(taxamount)) as amt')
                        ->from('creditsalesmaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("creditdate BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->amt;
        $data['cramountall'] = $this->db->select('(sum(totalamount)+sum(taxamount)) as amt')
                        ->from('creditsalesmaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->get()->row()->amt;
        $data['totalstock'] = $this->db->select('(sum(pprice * stock)) as stock')
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->get('productmaster')->row()->stock;
        $data['empsalary'] = $this->db->select('sum(asalary) as salary')
                        ->from('salarymaster S')
                        ->join('employeemaster E', 'E.userid = S.userid', 'join')
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("date BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->salary;

        $data['shopdamage'] = $this->db->select('sum(total) as sundry')
                        ->from('sundry_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("sdate BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->sundry;
        $data['acdrbalacne'] = $this->db->select('sum(balacne) as balacne')
                        ->where("baltype", "Debit")
                        ->get('bankmaster')->row()->balacne;
        $data['accrbalacne'] = $this->db->select('sum(balacne) as balacne')
                        ->where("baltype", "Credit")
                        ->get('bankmaster')->row()->balacne;
        $data['stock'] = $this->db->select('(sum(uprice * stock)) as stock')
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->get('productmaster')->row()->stock;
        $data['salary'] = $this->db->select('sum(asalary) as salary')
                        ->from('salarymaster S')
                        ->where('E.shopid', $this->session->userdata("shopid"))
                        ->join('employeemaster E', 'E.userid = S.userid', 'join')
                        ->where("date BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->salary;

        $data['sundry'] = $this->db->select('sum(total) as sundry')
                        ->from('sundry_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("sdate BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->sundry;
        $data['sundryall'] = $this->db->select('sum(total) as sundry')
                        ->from('sundry_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->get()->row()->sundry;
        $data['exppay'] = $this->db->select('sum(amount) as amount')
                        ->from('expancemaster E')->join('exptypemaster P', 'P.id = E.eptype', 'join')
                        ->where('exptype<>', 'FIXED ASSETS')
                        ->get()->row()->amount;
        $data['fixpay'] = $this->db->select('sum(amount) as amount')
                        ->from('expancemaster E')->join('exptypemaster P', 'P.id = E.eptype', 'join')
                        ->where('exptype', 'FIXED ASSETS')
                        ->get()->row()->amount;
        return $data;
    }

    public function prebalance($fromdate, $todate) {
        $fromtime = date('Y-m-01', strtotime("-1 months", strtotime($fromdate)));
        $totime = date('Y-m-', strtotime("-1 months", strtotime($todate))) . cal_days_in_month(CAL_GREGORIAN, date('m', strtotime($todate)), date('Y', strtotime($todate)));
        $data['purchase'] = $this->db->select('sum(amttotal+taxtotal) as purchase')
                        ->from('purchasemaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("pdate BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->purchase;
        $data['sales'] = $this->db->select('(sum(total_amount)+sum(taxamount)) as cash')
                        ->from('salesmaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("invoice_date BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->cash;
        $data['advance'] = $this->db->select('sum(advance) as advance')
                        ->get('customermaster')->row()->advance;
        $data['dradvance'] = $this->db->select('sum(debit) as advance')
                        ->from('advancmaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("date BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->advance;
        $data['cradvance'] = $this->db->select('sum(credit) as creditt')
                        ->from('advancmaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("date BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->creditt;
        $data['dramount'] = $this->db->select('(sum(taxtotal)+sum(amttotal)) as amt')
                        ->from('debitnotemaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("ddate BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->amt;
        $data['cramount'] = $this->db->select('(sum(totalamount)+sum(taxamount)) as amt')
                        ->from('creditsalesmaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("creditdate BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->amt;
        $data['totalstock'] = $this->db->select('(sum(pprice * stock)) as stock')
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->get('productmaster')->row()->stock;
        $data['empsalary'] = $this->db->select('sum(asalary) as salary')
                        ->from('salarymaster S')
                        ->join('employeemaster E', 'E.userid = S.userid', 'join')
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("date BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->salary;

        $data['shopdamage'] = $this->db->select('sum(total) as sundry')
                        ->from('sundry_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("sdate BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->sundry;
        $data['acdrbalacne'] = $this->db->select('sum(balacne) as balacne')
                        ->where("baltype", "Debit")
                        ->get('bankmaster')->row()->balacne;
        $data['accrbalacne'] = $this->db->select('sum(balacne) as balacne')
                        ->where("baltype", "Credit")
                        ->get('bankmaster')->row()->balacne;
        $data['stock'] = $this->db->select('(sum(uprice * stock)) as stock')
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->get('productmaster')->row()->stock;
        $data['salary'] = $this->db->select('sum(asalary) as salary')
                        ->from('salarymaster S')
                        ->where('E.shopid', $this->session->userdata("shopid"))
                        ->join('employeemaster E', 'E.userid = S.userid', 'join')
                        ->where("date BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->salary;

        $data['sundry'] = $this->db->select('sum(total) as sundry')
                        ->from('sundry_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("sdate BETWEEN '" . $fromtime . "' and '" . $totime . "'")
                        ->get()->row()->sundry;
        return $data;
    }

    public function balanceprepare() {
        $preres = $this->prebalance(date('Y-m-01'), date('Y-m-d'));
        $result = $this->db->like("date", date('Y-m'), "after")->get('balancemaster')->result();
        if (count($result) == 0) {
            $this->db->insert('balancemaster', array('copstock' => $preres['totalstock'], 'acopbal' => $preres['accrbalacne'], 'loanopbal' => $preres['acdrbalacne'], 'advopen' => $preres['advance'], 'date' => date('Y-m-01')));
            $this->db->like("date", date('Y-m', strtotime("-1 months")), "after")->update('balancemaster', array('cclstock' => $preres['totalstock'], 'acclbal' => $preres['accrbalacne'], 'loanclbal' => $preres['acdrbalacne'],
                'advcl' => $preres['advance'], 'mpbal' => ($preres['purchase'] - $preres['dramount']), 'msbal' => ($preres['sales'] - $preres['cramount'])));
        } else {
            $this->db->where("id", $result[0]->id)->update('balancemaster', array('copstock' => $preres['totalstock'], 'acopbal' => $preres['accrbalacne'], 'loanopbal' => $preres['acdrbalacne'], 'advopen' => $preres['advance']));
            /* $this->db->like("date", date('Y-m',strtotime("-1 months")), "after")->update('balancemaster', array('cclstock' => $preres['totalstock'], 'acclbal' => $preres['accrbalacne'],'loanclbal'=>$preres['acdrbalacne'],
              'advcl' => $preres['advance'],'mpbal'=>($preres['purchase']-$preres['dramount']),'msbal'=>($preres['sales']-$preres['cramount']))); */
        }
    }

    public function Balancesheetexp($fromdate, $todate) {
        $result = $this->db->get('exptypemaster')->result();
        $resn = array();
        foreach ($result as $res) {
            $ress = $this->db->select('eptype,sum(amount) as amt')
                            ->where("date BETWEEN '" . date('Y-m-01', strtotime($fromdate)) . "' and '" . date('Y-m-', strtotime($todate)) . cal_days_in_month(CAL_GREGORIAN, date('m', strtotime($todate)), date('Y', strtotime($todate))) . "'")
                            ->where("eptype", $res->id)->get('expancemaster')->result();
            $exp['exptype'] = $res->exptype;
            $exp['amt'] = $ress[0]->amt;
            array_push($resn, $exp);
        }
        return $resn;
    }

    public function balanceexpmaster($date) {
        $data['salary'] = $this->db->select('sum(asalary) as salary')->from('salarymaster S')
                        ->join('employeemaster E', 'E.userid = S.userid', 'join')
                        ->like("date", date('Y-m', strtotime($date)), "after")->get()->row()->salary;

        $data['sundry'] = $this->db->select('sum(total) as sundry')->from('sundry_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->like('sdate', date('Y-m', strtotime($date)))->get()->row()->sundry;
        return $data;
    }

    public function balancemaster($date, $todate) {
        return $this->db->like('date', date('Y-m', strtotime($date)), 'after')->get('balancemaster')->result();
    }

}
