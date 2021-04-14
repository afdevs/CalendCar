<?php
	class Form{
		protected $surround='p';
		protected $data;
		
		public function __construct($data=array()){
			$this->data=$data;
		}

		private function surround($html){
			return "<{$this->surround}>{$html}</{$this->surround}>";
		}
		private function getValue($index){
			return isset($this->data[$index]) ? $this->data[$index]:null;
		}
		public function inputText($name, $label){
			return "<div class='form-group'><label for='".strtolower($name)."' class='control-label'>".ucfirst($label)."</label><input type='text' class='form-control' name='$name' id='$name' value='". $this->getValue($name) ."' /></div>";
		}
		public function inputNumber($name, $label){
			return "<div class='form-group'><label for='".strtolower($name)."' class='control-label'>".ucfirst($label)."</label><input type='number' class='form-control' name='$name' id='$name' value='". $this->getValue($name) ."' /></div>";
		}
		public function inputMail($name, $label){
			return "<div class='form-group'><label for='".strtolower($name)."' class='control-label'>".ucfirst($label)." </label><input type='mail' class='form-control' name='$name' id='$name' value='". $this->getValue($name) ."' /></div>";
		}

		public function textarea($name, $label){
			return "<div class='form-group'><label for='".strtolower($name)."' class='control-label'>".ucfirst($label)."</label><textarea class='form-control' name='$name' id='$name' rows='3' >".$this->getValue($name)."</textarea></div>";
		}

		public function submit($name){
			return $this->surround("<input type='submit' class='btn btn-default' name='".strtolower($name)."' id='".strtolower($name)."' value='$name' />");
		}
	}
?>