module ArrayDup
  refine Array do
    def dup
      Marshal.load(Marshal.dump(self))
    end
  end
end